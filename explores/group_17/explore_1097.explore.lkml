# Explore: explore_1097
# Auto-generated LookML Explore File

include: "/views/domain_42/view_03292.view.lkml"
include: "/views/domain_44/view_03294.view.lkml"
include: "/views/domain_45/view_03295.view.lkml"
include: "/views/domain_46/view_03296.view.lkml"

explore: explore_1097 {
  label: "Explore Explore 1097"
  description: "Comprehensive analytics explore joining base view_03292 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_03292
  
  always_filter: {
    filters: [view_03292.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03292.created_at_date: "7 days"]
    unless: [view_03292.id, view_03292.status]
  }

  join: view_03294 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03292.user_id} = ${view_03294.id} ;;
    required_joins: []
  }

  join: view_03295 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03292.account_id} = ${view_03295.account_id} ;;
    required_joins: [view_03294]
  }

  join: view_03296 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03292.category} = ${view_03296.category} ;;
  }

  access_filter: {
    field: view_03292.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03292.is_deleted} = false ;;
}
