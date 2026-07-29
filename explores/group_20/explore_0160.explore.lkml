# Explore: explore_0160
# Auto-generated LookML Explore File

include: "/views/domain_31/view_00481.view.lkml"
include: "/views/domain_33/view_00483.view.lkml"
include: "/views/domain_34/view_00484.view.lkml"
include: "/views/domain_35/view_00485.view.lkml"

explore: explore_0160 {
  label: "Explore Explore 0160"
  description: "Comprehensive analytics explore joining base view_00481 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_00481
  
  always_filter: {
    filters: [view_00481.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00481.created_at_date: "7 days"]
    unless: [view_00481.id, view_00481.status]
  }

  join: view_00483 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00481.user_id} = ${view_00483.id} ;;
    required_joins: []
  }

  join: view_00484 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00481.account_id} = ${view_00484.account_id} ;;
    required_joins: [view_00483]
  }

  join: view_00485 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00481.category} = ${view_00485.category} ;;
  }

  access_filter: {
    field: view_00481.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00481.is_deleted} = false ;;
}
