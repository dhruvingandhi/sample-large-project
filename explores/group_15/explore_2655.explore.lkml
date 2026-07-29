# Explore: explore_2655
# Auto-generated LookML Explore File

include: "/views/domain_16/view_07966.view.lkml"
include: "/views/domain_18/view_07968.view.lkml"
include: "/views/domain_19/view_07969.view.lkml"
include: "/views/domain_20/view_07970.view.lkml"

explore: explore_2655 {
  label: "Explore Explore 2655"
  description: "Comprehensive analytics explore joining base view_07966 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_07966
  
  always_filter: {
    filters: [view_07966.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07966.created_at_date: "7 days"]
    unless: [view_07966.id, view_07966.status]
  }

  join: view_07968 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07966.user_id} = ${view_07968.id} ;;
    required_joins: []
  }

  join: view_07969 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07966.account_id} = ${view_07969.account_id} ;;
    required_joins: [view_07968]
  }

  join: view_07970 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07966.category} = ${view_07970.category} ;;
  }

  access_filter: {
    field: view_07966.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07966.is_deleted} = false ;;
}
