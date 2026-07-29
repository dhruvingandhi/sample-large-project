# Explore: explore_0854
# Auto-generated LookML Explore File

include: "/views/domain_13/view_02563.view.lkml"
include: "/views/domain_15/view_02565.view.lkml"
include: "/views/domain_16/view_02566.view.lkml"
include: "/views/domain_17/view_02567.view.lkml"

explore: explore_0854 {
  label: "Explore Explore 0854"
  description: "Comprehensive analytics explore joining base view_02563 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_02563
  
  always_filter: {
    filters: [view_02563.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02563.created_at_date: "7 days"]
    unless: [view_02563.id, view_02563.status]
  }

  join: view_02565 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02563.user_id} = ${view_02565.id} ;;
    required_joins: []
  }

  join: view_02566 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02563.account_id} = ${view_02566.account_id} ;;
    required_joins: [view_02565]
  }

  join: view_02567 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02563.category} = ${view_02567.category} ;;
  }

  access_filter: {
    field: view_02563.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02563.is_deleted} = false ;;
}
