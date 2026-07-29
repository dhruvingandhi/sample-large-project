# Explore: explore_0577
# Auto-generated LookML Explore File

include: "/views/domain_32/view_01732.view.lkml"
include: "/views/domain_34/view_01734.view.lkml"
include: "/views/domain_35/view_01735.view.lkml"
include: "/views/domain_36/view_01736.view.lkml"

explore: explore_0577 {
  label: "Explore Explore 0577"
  description: "Comprehensive analytics explore joining base view_01732 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_01732
  
  always_filter: {
    filters: [view_01732.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01732.created_at_date: "7 days"]
    unless: [view_01732.id, view_01732.status]
  }

  join: view_01734 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01732.user_id} = ${view_01734.id} ;;
    required_joins: []
  }

  join: view_01735 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01732.account_id} = ${view_01735.account_id} ;;
    required_joins: [view_01734]
  }

  join: view_01736 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01732.category} = ${view_01736.category} ;;
  }

  access_filter: {
    field: view_01732.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01732.is_deleted} = false ;;
}
