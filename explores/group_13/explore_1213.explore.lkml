# Explore: explore_1213
# Auto-generated LookML Explore File

include: "/views/domain_40/view_03640.view.lkml"
include: "/views/domain_42/view_03642.view.lkml"
include: "/views/domain_43/view_03643.view.lkml"
include: "/views/domain_44/view_03644.view.lkml"

explore: explore_1213 {
  label: "Explore Explore 1213"
  description: "Comprehensive analytics explore joining base view_03640 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_03640
  
  always_filter: {
    filters: [view_03640.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03640.created_at_date: "7 days"]
    unless: [view_03640.id, view_03640.status]
  }

  join: view_03642 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03640.user_id} = ${view_03642.id} ;;
    required_joins: []
  }

  join: view_03643 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03640.account_id} = ${view_03643.account_id} ;;
    required_joins: [view_03642]
  }

  join: view_03644 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03640.category} = ${view_03644.category} ;;
  }

  access_filter: {
    field: view_03640.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03640.is_deleted} = false ;;
}
