# Explore: explore_3348
# Auto-generated LookML Explore File

include: "/views/domain_45/view_10045.view.lkml"
include: "/views/domain_47/view_10047.view.lkml"
include: "/views/domain_48/view_10048.view.lkml"
include: "/views/domain_49/view_10049.view.lkml"

explore: explore_3348 {
  label: "Explore Explore 3348"
  description: "Comprehensive analytics explore joining base view_10045 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_10045
  
  always_filter: {
    filters: [view_10045.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10045.created_at_date: "7 days"]
    unless: [view_10045.id, view_10045.status]
  }

  join: view_10047 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10045.user_id} = ${view_10047.id} ;;
    required_joins: []
  }

  join: view_10048 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10045.account_id} = ${view_10048.account_id} ;;
    required_joins: [view_10047]
  }

  join: view_10049 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10045.category} = ${view_10049.category} ;;
  }

  access_filter: {
    field: view_10045.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10045.is_deleted} = false ;;
}
