# Explore: explore_0695
# Auto-generated LookML Explore File

include: "/views/domain_36/view_02086.view.lkml"
include: "/views/domain_38/view_02088.view.lkml"
include: "/views/domain_39/view_02089.view.lkml"
include: "/views/domain_40/view_02090.view.lkml"

explore: explore_0695 {
  label: "Explore Explore 0695"
  description: "Comprehensive analytics explore joining base view_02086 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_02086
  
  always_filter: {
    filters: [view_02086.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02086.created_at_date: "7 days"]
    unless: [view_02086.id, view_02086.status]
  }

  join: view_02088 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02086.user_id} = ${view_02088.id} ;;
    required_joins: []
  }

  join: view_02089 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02086.account_id} = ${view_02089.account_id} ;;
    required_joins: [view_02088]
  }

  join: view_02090 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02086.category} = ${view_02090.category} ;;
  }

  access_filter: {
    field: view_02086.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02086.is_deleted} = false ;;
}
