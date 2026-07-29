# Explore: explore_1163
# Auto-generated LookML Explore File

include: "/views/domain_40/view_03490.view.lkml"
include: "/views/domain_42/view_03492.view.lkml"
include: "/views/domain_43/view_03493.view.lkml"
include: "/views/domain_44/view_03494.view.lkml"

explore: explore_1163 {
  label: "Explore Explore 1163"
  description: "Comprehensive analytics explore joining base view_03490 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_03490
  
  always_filter: {
    filters: [view_03490.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03490.created_at_date: "7 days"]
    unless: [view_03490.id, view_03490.status]
  }

  join: view_03492 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03490.user_id} = ${view_03492.id} ;;
    required_joins: []
  }

  join: view_03493 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03490.account_id} = ${view_03493.account_id} ;;
    required_joins: [view_03492]
  }

  join: view_03494 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03490.category} = ${view_03494.category} ;;
  }

  access_filter: {
    field: view_03490.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03490.is_deleted} = false ;;
}
