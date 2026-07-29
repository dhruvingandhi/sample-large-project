# Explore: explore_3356
# Auto-generated LookML Explore File

include: "/views/domain_19/view_10069.view.lkml"
include: "/views/domain_21/view_10071.view.lkml"
include: "/views/domain_22/view_10072.view.lkml"
include: "/views/domain_23/view_10073.view.lkml"

explore: explore_3356 {
  label: "Explore Explore 3356"
  description: "Comprehensive analytics explore joining base view_10069 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_10069
  
  always_filter: {
    filters: [view_10069.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10069.created_at_date: "7 days"]
    unless: [view_10069.id, view_10069.status]
  }

  join: view_10071 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10069.user_id} = ${view_10071.id} ;;
    required_joins: []
  }

  join: view_10072 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10069.account_id} = ${view_10072.account_id} ;;
    required_joins: [view_10071]
  }

  join: view_10073 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10069.category} = ${view_10073.category} ;;
  }

  access_filter: {
    field: view_10069.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10069.is_deleted} = false ;;
}
