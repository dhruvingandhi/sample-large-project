# Explore: explore_1477
# Auto-generated LookML Explore File

include: "/views/domain_32/view_04432.view.lkml"
include: "/views/domain_34/view_04434.view.lkml"
include: "/views/domain_35/view_04435.view.lkml"
include: "/views/domain_36/view_04436.view.lkml"

explore: explore_1477 {
  label: "Explore Explore 1477"
  description: "Comprehensive analytics explore joining base view_04432 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_04432
  
  always_filter: {
    filters: [view_04432.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04432.created_at_date: "7 days"]
    unless: [view_04432.id, view_04432.status]
  }

  join: view_04434 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04432.user_id} = ${view_04434.id} ;;
    required_joins: []
  }

  join: view_04435 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04432.account_id} = ${view_04435.account_id} ;;
    required_joins: [view_04434]
  }

  join: view_04436 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04432.category} = ${view_04436.category} ;;
  }

  access_filter: {
    field: view_04432.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04432.is_deleted} = false ;;
}
