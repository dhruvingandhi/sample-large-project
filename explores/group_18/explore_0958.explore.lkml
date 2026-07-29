# Explore: explore_0958
# Auto-generated LookML Explore File

include: "/views/domain_25/view_02875.view.lkml"
include: "/views/domain_27/view_02877.view.lkml"
include: "/views/domain_28/view_02878.view.lkml"
include: "/views/domain_29/view_02879.view.lkml"

explore: explore_0958 {
  label: "Explore Explore 0958"
  description: "Comprehensive analytics explore joining base view_02875 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_02875
  
  always_filter: {
    filters: [view_02875.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02875.created_at_date: "7 days"]
    unless: [view_02875.id, view_02875.status]
  }

  join: view_02877 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02875.user_id} = ${view_02877.id} ;;
    required_joins: []
  }

  join: view_02878 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02875.account_id} = ${view_02878.account_id} ;;
    required_joins: [view_02877]
  }

  join: view_02879 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02875.category} = ${view_02879.category} ;;
  }

  access_filter: {
    field: view_02875.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02875.is_deleted} = false ;;
}
