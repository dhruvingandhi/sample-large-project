# Explore: explore_3847
# Auto-generated LookML Explore File

include: "/views/domain_42/view_11542.view.lkml"
include: "/views/domain_44/view_11544.view.lkml"
include: "/views/domain_45/view_11545.view.lkml"
include: "/views/domain_46/view_11546.view.lkml"

explore: explore_3847 {
  label: "Explore Explore 3847"
  description: "Comprehensive analytics explore joining base view_11542 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_11542
  
  always_filter: {
    filters: [view_11542.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11542.created_at_date: "7 days"]
    unless: [view_11542.id, view_11542.status]
  }

  join: view_11544 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11542.user_id} = ${view_11544.id} ;;
    required_joins: []
  }

  join: view_11545 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11542.account_id} = ${view_11545.account_id} ;;
    required_joins: [view_11544]
  }

  join: view_11546 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11542.category} = ${view_11546.category} ;;
  }

  access_filter: {
    field: view_11542.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11542.is_deleted} = false ;;
}
