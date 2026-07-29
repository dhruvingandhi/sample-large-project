# Explore: explore_3359
# Auto-generated LookML Explore File

include: "/views/domain_28/view_10078.view.lkml"
include: "/views/domain_30/view_10080.view.lkml"
include: "/views/domain_31/view_10081.view.lkml"
include: "/views/domain_32/view_10082.view.lkml"

explore: explore_3359 {
  label: "Explore Explore 3359"
  description: "Comprehensive analytics explore joining base view_10078 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_10078
  
  always_filter: {
    filters: [view_10078.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10078.created_at_date: "7 days"]
    unless: [view_10078.id, view_10078.status]
  }

  join: view_10080 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10078.user_id} = ${view_10080.id} ;;
    required_joins: []
  }

  join: view_10081 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10078.account_id} = ${view_10081.account_id} ;;
    required_joins: [view_10080]
  }

  join: view_10082 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10078.category} = ${view_10082.category} ;;
  }

  access_filter: {
    field: view_10078.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10078.is_deleted} = false ;;
}
