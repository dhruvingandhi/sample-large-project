# Explore: explore_3861
# Auto-generated LookML Explore File

include: "/views/domain_34/view_11584.view.lkml"
include: "/views/domain_36/view_11586.view.lkml"
include: "/views/domain_37/view_11587.view.lkml"
include: "/views/domain_38/view_11588.view.lkml"

explore: explore_3861 {
  label: "Explore Explore 3861"
  description: "Comprehensive analytics explore joining base view_11584 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_11584
  
  always_filter: {
    filters: [view_11584.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11584.created_at_date: "7 days"]
    unless: [view_11584.id, view_11584.status]
  }

  join: view_11586 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11584.user_id} = ${view_11586.id} ;;
    required_joins: []
  }

  join: view_11587 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11584.account_id} = ${view_11587.account_id} ;;
    required_joins: [view_11586]
  }

  join: view_11588 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11584.category} = ${view_11588.category} ;;
  }

  access_filter: {
    field: view_11584.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11584.is_deleted} = false ;;
}
