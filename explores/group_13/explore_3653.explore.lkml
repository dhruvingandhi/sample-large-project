# Explore: explore_3653
# Auto-generated LookML Explore File

include: "/views/domain_10/view_10960.view.lkml"
include: "/views/domain_12/view_10962.view.lkml"
include: "/views/domain_13/view_10963.view.lkml"
include: "/views/domain_14/view_10964.view.lkml"

explore: explore_3653 {
  label: "Explore Explore 3653"
  description: "Comprehensive analytics explore joining base view_10960 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_10960
  
  always_filter: {
    filters: [view_10960.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10960.created_at_date: "7 days"]
    unless: [view_10960.id, view_10960.status]
  }

  join: view_10962 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10960.user_id} = ${view_10962.id} ;;
    required_joins: []
  }

  join: view_10963 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10960.account_id} = ${view_10963.account_id} ;;
    required_joins: [view_10962]
  }

  join: view_10964 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10960.category} = ${view_10964.category} ;;
  }

  access_filter: {
    field: view_10960.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10960.is_deleted} = false ;;
}
