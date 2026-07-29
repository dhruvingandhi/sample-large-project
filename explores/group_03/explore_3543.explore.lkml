# Explore: explore_3543
# Auto-generated LookML Explore File

include: "/views/domain_30/view_10630.view.lkml"
include: "/views/domain_32/view_10632.view.lkml"
include: "/views/domain_33/view_10633.view.lkml"
include: "/views/domain_34/view_10634.view.lkml"

explore: explore_3543 {
  label: "Explore Explore 3543"
  description: "Comprehensive analytics explore joining base view_10630 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_10630
  
  always_filter: {
    filters: [view_10630.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10630.created_at_date: "7 days"]
    unless: [view_10630.id, view_10630.status]
  }

  join: view_10632 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10630.user_id} = ${view_10632.id} ;;
    required_joins: []
  }

  join: view_10633 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10630.account_id} = ${view_10633.account_id} ;;
    required_joins: [view_10632]
  }

  join: view_10634 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10630.category} = ${view_10634.category} ;;
  }

  access_filter: {
    field: view_10630.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10630.is_deleted} = false ;;
}
