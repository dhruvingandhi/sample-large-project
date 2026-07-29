# Explore: explore_3656
# Auto-generated LookML Explore File

include: "/views/domain_19/view_10969.view.lkml"
include: "/views/domain_21/view_10971.view.lkml"
include: "/views/domain_22/view_10972.view.lkml"
include: "/views/domain_23/view_10973.view.lkml"

explore: explore_3656 {
  label: "Explore Explore 3656"
  description: "Comprehensive analytics explore joining base view_10969 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_10969
  
  always_filter: {
    filters: [view_10969.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10969.created_at_date: "7 days"]
    unless: [view_10969.id, view_10969.status]
  }

  join: view_10971 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10969.user_id} = ${view_10971.id} ;;
    required_joins: []
  }

  join: view_10972 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10969.account_id} = ${view_10972.account_id} ;;
    required_joins: [view_10971]
  }

  join: view_10973 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10969.category} = ${view_10973.category} ;;
  }

  access_filter: {
    field: view_10969.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10969.is_deleted} = false ;;
}
