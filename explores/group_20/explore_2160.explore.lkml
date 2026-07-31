# Update for 2000 file diff target
# Explore: explore_2160
# Auto-generated LookML Explore File

include: "/views/domain_31/view_06481.view.lkml"
include: "/views/domain_33/view_06483.view.lkml"
include: "/views/domain_34/view_06484.view.lkml"
include: "/views/domain_35/view_06485.view.lkml"

explore: explore_2160 {
  label: "Explore Explore 2160"
  description: "Comprehensive analytics explore joining base view_06481 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_06481
  
  always_filter: {
    filters: [view_06481.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06481.created_at_date: "7 days"]
    unless: [view_06481.id, view_06481.status]
  }

  join: view_06483 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06481.user_id} = ${view_06483.id} ;;
    required_joins: []
  }

  join: view_06484 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06481.account_id} = ${view_06484.account_id} ;;
    required_joins: [view_06483]
  }

  join: view_06485 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06481.category} = ${view_06485.category} ;;
  }

  access_filter: {
    field: view_06481.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06481.is_deleted} = false ;;
}
