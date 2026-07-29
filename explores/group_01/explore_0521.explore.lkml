# Explore: explore_0521
# Auto-generated LookML Explore File

include: "/views/domain_14/view_01564.view.lkml"
include: "/views/domain_16/view_01566.view.lkml"
include: "/views/domain_17/view_01567.view.lkml"
include: "/views/domain_18/view_01568.view.lkml"

explore: explore_0521 {
  label: "Explore Explore 0521"
  description: "Comprehensive analytics explore joining base view_01564 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_01564
  
  always_filter: {
    filters: [view_01564.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01564.created_at_date: "7 days"]
    unless: [view_01564.id, view_01564.status]
  }

  join: view_01566 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01564.user_id} = ${view_01566.id} ;;
    required_joins: []
  }

  join: view_01567 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01564.account_id} = ${view_01567.account_id} ;;
    required_joins: [view_01566]
  }

  join: view_01568 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01564.category} = ${view_01568.category} ;;
  }

  access_filter: {
    field: view_01564.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01564.is_deleted} = false ;;
}
