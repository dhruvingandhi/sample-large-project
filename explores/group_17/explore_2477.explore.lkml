# Explore: explore_2477
# Auto-generated LookML Explore File

include: "/views/domain_32/view_07432.view.lkml"
include: "/views/domain_34/view_07434.view.lkml"
include: "/views/domain_35/view_07435.view.lkml"
include: "/views/domain_36/view_07436.view.lkml"

explore: explore_2477 {
  label: "Explore Explore 2477"
  description: "Comprehensive analytics explore joining base view_07432 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_07432
  
  always_filter: {
    filters: [view_07432.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07432.created_at_date: "7 days"]
    unless: [view_07432.id, view_07432.status]
  }

  join: view_07434 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07432.user_id} = ${view_07434.id} ;;
    required_joins: []
  }

  join: view_07435 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07432.account_id} = ${view_07435.account_id} ;;
    required_joins: [view_07434]
  }

  join: view_07436 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07432.category} = ${view_07436.category} ;;
  }

  access_filter: {
    field: view_07432.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07432.is_deleted} = false ;;
}
