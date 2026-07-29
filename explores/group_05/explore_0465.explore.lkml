# Explore: explore_0465
# Auto-generated LookML Explore File

include: "/views/domain_46/view_01396.view.lkml"
include: "/views/domain_48/view_01398.view.lkml"
include: "/views/domain_49/view_01399.view.lkml"
include: "/views/domain_50/view_01400.view.lkml"

explore: explore_0465 {
  label: "Explore Explore 0465"
  description: "Comprehensive analytics explore joining base view_01396 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_01396
  
  always_filter: {
    filters: [view_01396.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01396.created_at_date: "7 days"]
    unless: [view_01396.id, view_01396.status]
  }

  join: view_01398 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01396.user_id} = ${view_01398.id} ;;
    required_joins: []
  }

  join: view_01399 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01396.account_id} = ${view_01399.account_id} ;;
    required_joins: [view_01398]
  }

  join: view_01400 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01396.category} = ${view_01400.category} ;;
  }

  access_filter: {
    field: view_01396.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01396.is_deleted} = false ;;
}
