# Explore: explore_0063
# Auto-generated LookML Explore File

include: "/views/domain_40/view_00190.view.lkml"
include: "/views/domain_42/view_00192.view.lkml"
include: "/views/domain_43/view_00193.view.lkml"
include: "/views/domain_44/view_00194.view.lkml"

explore: explore_0063 {
  label: "Explore Explore 0063"
  description: "Comprehensive analytics explore joining base view_00190 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_00190
  
  always_filter: {
    filters: [view_00190.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00190.created_at_date: "7 days"]
    unless: [view_00190.id, view_00190.status]
  }

  join: view_00192 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00190.user_id} = ${view_00192.id} ;;
    required_joins: []
  }

  join: view_00193 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00190.account_id} = ${view_00193.account_id} ;;
    required_joins: [view_00192]
  }

  join: view_00194 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00190.category} = ${view_00194.category} ;;
  }

  access_filter: {
    field: view_00190.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00190.is_deleted} = false ;;
}
