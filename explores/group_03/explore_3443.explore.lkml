# Explore: explore_3443
# Auto-generated LookML Explore File

include: "/views/domain_30/view_10330.view.lkml"
include: "/views/domain_32/view_10332.view.lkml"
include: "/views/domain_33/view_10333.view.lkml"
include: "/views/domain_34/view_10334.view.lkml"

explore: explore_3443 {
  label: "Explore Explore 3443"
  description: "Comprehensive analytics explore joining base view_10330 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_10330
  
  always_filter: {
    filters: [view_10330.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10330.created_at_date: "7 days"]
    unless: [view_10330.id, view_10330.status]
  }

  join: view_10332 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10330.user_id} = ${view_10332.id} ;;
    required_joins: []
  }

  join: view_10333 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10330.account_id} = ${view_10333.account_id} ;;
    required_joins: [view_10332]
  }

  join: view_10334 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10330.category} = ${view_10334.category} ;;
  }

  access_filter: {
    field: view_10330.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10330.is_deleted} = false ;;
}
