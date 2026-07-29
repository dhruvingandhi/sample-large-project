# Explore: explore_2163
# Auto-generated LookML Explore File

include: "/views/domain_40/view_06490.view.lkml"
include: "/views/domain_42/view_06492.view.lkml"
include: "/views/domain_43/view_06493.view.lkml"
include: "/views/domain_44/view_06494.view.lkml"

explore: explore_2163 {
  label: "Explore Explore 2163"
  description: "Comprehensive analytics explore joining base view_06490 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_06490
  
  always_filter: {
    filters: [view_06490.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06490.created_at_date: "7 days"]
    unless: [view_06490.id, view_06490.status]
  }

  join: view_06492 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06490.user_id} = ${view_06492.id} ;;
    required_joins: []
  }

  join: view_06493 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06490.account_id} = ${view_06493.account_id} ;;
    required_joins: [view_06492]
  }

  join: view_06494 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06490.category} = ${view_06494.category} ;;
  }

  access_filter: {
    field: view_06490.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06490.is_deleted} = false ;;
}
