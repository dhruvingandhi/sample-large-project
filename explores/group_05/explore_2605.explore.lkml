# Explore: explore_2605
# Auto-generated LookML Explore File

include: "/views/domain_16/view_07816.view.lkml"
include: "/views/domain_18/view_07818.view.lkml"
include: "/views/domain_19/view_07819.view.lkml"
include: "/views/domain_20/view_07820.view.lkml"

explore: explore_2605 {
  label: "Explore Explore 2605"
  description: "Comprehensive analytics explore joining base view_07816 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_07816
  
  always_filter: {
    filters: [view_07816.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07816.created_at_date: "7 days"]
    unless: [view_07816.id, view_07816.status]
  }

  join: view_07818 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07816.user_id} = ${view_07818.id} ;;
    required_joins: []
  }

  join: view_07819 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07816.account_id} = ${view_07819.account_id} ;;
    required_joins: [view_07818]
  }

  join: view_07820 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07816.category} = ${view_07820.category} ;;
  }

  access_filter: {
    field: view_07816.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07816.is_deleted} = false ;;
}
