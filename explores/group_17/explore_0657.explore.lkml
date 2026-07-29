# Explore: explore_0657
# Auto-generated LookML Explore File

include: "/views/domain_22/view_01972.view.lkml"
include: "/views/domain_24/view_01974.view.lkml"
include: "/views/domain_25/view_01975.view.lkml"
include: "/views/domain_26/view_01976.view.lkml"

explore: explore_0657 {
  label: "Explore Explore 0657"
  description: "Comprehensive analytics explore joining base view_01972 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_01972
  
  always_filter: {
    filters: [view_01972.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01972.created_at_date: "7 days"]
    unless: [view_01972.id, view_01972.status]
  }

  join: view_01974 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01972.user_id} = ${view_01974.id} ;;
    required_joins: []
  }

  join: view_01975 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01972.account_id} = ${view_01975.account_id} ;;
    required_joins: [view_01974]
  }

  join: view_01976 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01972.category} = ${view_01976.category} ;;
  }

  access_filter: {
    field: view_01972.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01972.is_deleted} = false ;;
}
