# Explore: explore_3709
# Auto-generated LookML Explore File

include: "/views/domain_28/view_11128.view.lkml"
include: "/views/domain_30/view_11130.view.lkml"
include: "/views/domain_31/view_11131.view.lkml"
include: "/views/domain_32/view_11132.view.lkml"

explore: explore_3709 {
  label: "Explore Explore 3709"
  description: "Comprehensive analytics explore joining base view_11128 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_11128
  
  always_filter: {
    filters: [view_11128.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11128.created_at_date: "7 days"]
    unless: [view_11128.id, view_11128.status]
  }

  join: view_11130 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11128.user_id} = ${view_11130.id} ;;
    required_joins: []
  }

  join: view_11131 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11128.account_id} = ${view_11131.account_id} ;;
    required_joins: [view_11130]
  }

  join: view_11132 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11128.category} = ${view_11132.category} ;;
  }

  access_filter: {
    field: view_11128.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11128.is_deleted} = false ;;
}
