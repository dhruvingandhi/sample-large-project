# Explore: explore_0161
# Auto-generated LookML Explore File

include: "/views/domain_34/view_00484.view.lkml"
include: "/views/domain_36/view_00486.view.lkml"
include: "/views/domain_37/view_00487.view.lkml"
include: "/views/domain_38/view_00488.view.lkml"

explore: explore_0161 {
  label: "Explore Explore 0161"
  description: "Comprehensive analytics explore joining base view_00484 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_00484
  
  always_filter: {
    filters: [view_00484.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00484.created_at_date: "7 days"]
    unless: [view_00484.id, view_00484.status]
  }

  join: view_00486 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00484.user_id} = ${view_00486.id} ;;
    required_joins: []
  }

  join: view_00487 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00484.account_id} = ${view_00487.account_id} ;;
    required_joins: [view_00486]
  }

  join: view_00488 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00484.category} = ${view_00488.category} ;;
  }

  access_filter: {
    field: view_00484.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00484.is_deleted} = false ;;
}
