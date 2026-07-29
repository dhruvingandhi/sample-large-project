# Explore: explore_3582
# Auto-generated LookML Explore File

include: "/views/domain_47/view_10747.view.lkml"
include: "/views/domain_49/view_10749.view.lkml"
include: "/views/domain_50/view_10750.view.lkml"
include: "/views/domain_01/view_10751.view.lkml"

explore: explore_3582 {
  label: "Explore Explore 3582"
  description: "Comprehensive analytics explore joining base view_10747 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_10747
  
  always_filter: {
    filters: [view_10747.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10747.created_at_date: "7 days"]
    unless: [view_10747.id, view_10747.status]
  }

  join: view_10749 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10747.user_id} = ${view_10749.id} ;;
    required_joins: []
  }

  join: view_10750 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10747.account_id} = ${view_10750.account_id} ;;
    required_joins: [view_10749]
  }

  join: view_10751 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10747.category} = ${view_10751.category} ;;
  }

  access_filter: {
    field: view_10747.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10747.is_deleted} = false ;;
}
