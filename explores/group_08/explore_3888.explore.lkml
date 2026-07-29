# Explore: explore_3888
# Auto-generated LookML Explore File

include: "/views/domain_15/view_11665.view.lkml"
include: "/views/domain_17/view_11667.view.lkml"
include: "/views/domain_18/view_11668.view.lkml"
include: "/views/domain_19/view_11669.view.lkml"

explore: explore_3888 {
  label: "Explore Explore 3888"
  description: "Comprehensive analytics explore joining base view_11665 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_11665
  
  always_filter: {
    filters: [view_11665.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11665.created_at_date: "7 days"]
    unless: [view_11665.id, view_11665.status]
  }

  join: view_11667 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11665.user_id} = ${view_11667.id} ;;
    required_joins: []
  }

  join: view_11668 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11665.account_id} = ${view_11668.account_id} ;;
    required_joins: [view_11667]
  }

  join: view_11669 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11665.category} = ${view_11669.category} ;;
  }

  access_filter: {
    field: view_11665.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11665.is_deleted} = false ;;
}
