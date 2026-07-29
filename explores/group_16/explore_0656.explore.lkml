# Explore: explore_0656
# Auto-generated LookML Explore File

include: "/views/domain_19/view_01969.view.lkml"
include: "/views/domain_21/view_01971.view.lkml"
include: "/views/domain_22/view_01972.view.lkml"
include: "/views/domain_23/view_01973.view.lkml"

explore: explore_0656 {
  label: "Explore Explore 0656"
  description: "Comprehensive analytics explore joining base view_01969 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_01969
  
  always_filter: {
    filters: [view_01969.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01969.created_at_date: "7 days"]
    unless: [view_01969.id, view_01969.status]
  }

  join: view_01971 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01969.user_id} = ${view_01971.id} ;;
    required_joins: []
  }

  join: view_01972 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01969.account_id} = ${view_01972.account_id} ;;
    required_joins: [view_01971]
  }

  join: view_01973 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01969.category} = ${view_01973.category} ;;
  }

  access_filter: {
    field: view_01969.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01969.is_deleted} = false ;;
}
