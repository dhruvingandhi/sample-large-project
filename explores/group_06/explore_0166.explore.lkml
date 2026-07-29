# Explore: explore_0166
# Auto-generated LookML Explore File

include: "/views/domain_49/view_00499.view.lkml"
include: "/views/domain_01/view_00501.view.lkml"
include: "/views/domain_02/view_00502.view.lkml"
include: "/views/domain_03/view_00503.view.lkml"

explore: explore_0166 {
  label: "Explore Explore 0166"
  description: "Comprehensive analytics explore joining base view_00499 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_00499
  
  always_filter: {
    filters: [view_00499.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00499.created_at_date: "7 days"]
    unless: [view_00499.id, view_00499.status]
  }

  join: view_00501 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00499.user_id} = ${view_00501.id} ;;
    required_joins: []
  }

  join: view_00502 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00499.account_id} = ${view_00502.account_id} ;;
    required_joins: [view_00501]
  }

  join: view_00503 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00499.category} = ${view_00503.category} ;;
  }

  access_filter: {
    field: view_00499.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00499.is_deleted} = false ;;
}
