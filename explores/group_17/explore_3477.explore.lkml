# Explore: explore_3477
# Auto-generated LookML Explore File

include: "/views/domain_32/view_10432.view.lkml"
include: "/views/domain_34/view_10434.view.lkml"
include: "/views/domain_35/view_10435.view.lkml"
include: "/views/domain_36/view_10436.view.lkml"

explore: explore_3477 {
  label: "Explore Explore 3477"
  description: "Comprehensive analytics explore joining base view_10432 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_10432
  
  always_filter: {
    filters: [view_10432.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10432.created_at_date: "7 days"]
    unless: [view_10432.id, view_10432.status]
  }

  join: view_10434 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10432.user_id} = ${view_10434.id} ;;
    required_joins: []
  }

  join: view_10435 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10432.account_id} = ${view_10435.account_id} ;;
    required_joins: [view_10434]
  }

  join: view_10436 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10432.category} = ${view_10436.category} ;;
  }

  access_filter: {
    field: view_10432.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10432.is_deleted} = false ;;
}
