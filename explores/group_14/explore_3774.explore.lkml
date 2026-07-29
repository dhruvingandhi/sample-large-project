# Explore: explore_3774
# Auto-generated LookML Explore File

include: "/views/domain_23/view_11323.view.lkml"
include: "/views/domain_25/view_11325.view.lkml"
include: "/views/domain_26/view_11326.view.lkml"
include: "/views/domain_27/view_11327.view.lkml"

explore: explore_3774 {
  label: "Explore Explore 3774"
  description: "Comprehensive analytics explore joining base view_11323 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_11323
  
  always_filter: {
    filters: [view_11323.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11323.created_at_date: "7 days"]
    unless: [view_11323.id, view_11323.status]
  }

  join: view_11325 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11323.user_id} = ${view_11325.id} ;;
    required_joins: []
  }

  join: view_11326 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11323.account_id} = ${view_11326.account_id} ;;
    required_joins: [view_11325]
  }

  join: view_11327 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11323.category} = ${view_11327.category} ;;
  }

  access_filter: {
    field: view_11323.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11323.is_deleted} = false ;;
}
