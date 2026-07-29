# Explore: explore_0811
# Auto-generated LookML Explore File

include: "/views/domain_34/view_02434.view.lkml"
include: "/views/domain_36/view_02436.view.lkml"
include: "/views/domain_37/view_02437.view.lkml"
include: "/views/domain_38/view_02438.view.lkml"

explore: explore_0811 {
  label: "Explore Explore 0811"
  description: "Comprehensive analytics explore joining base view_02434 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_02434
  
  always_filter: {
    filters: [view_02434.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02434.created_at_date: "7 days"]
    unless: [view_02434.id, view_02434.status]
  }

  join: view_02436 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02434.user_id} = ${view_02436.id} ;;
    required_joins: []
  }

  join: view_02437 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02434.account_id} = ${view_02437.account_id} ;;
    required_joins: [view_02436]
  }

  join: view_02438 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02434.category} = ${view_02438.category} ;;
  }

  access_filter: {
    field: view_02434.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02434.is_deleted} = false ;;
}
