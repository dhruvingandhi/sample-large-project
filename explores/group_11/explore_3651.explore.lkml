# Explore: explore_3651
# Auto-generated LookML Explore File

include: "/views/domain_04/view_10954.view.lkml"
include: "/views/domain_06/view_10956.view.lkml"
include: "/views/domain_07/view_10957.view.lkml"
include: "/views/domain_08/view_10958.view.lkml"

explore: explore_3651 {
  label: "Explore Explore 3651"
  description: "Comprehensive analytics explore joining base view_10954 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_10954
  
  always_filter: {
    filters: [view_10954.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10954.created_at_date: "7 days"]
    unless: [view_10954.id, view_10954.status]
  }

  join: view_10956 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10954.user_id} = ${view_10956.id} ;;
    required_joins: []
  }

  join: view_10957 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10954.account_id} = ${view_10957.account_id} ;;
    required_joins: [view_10956]
  }

  join: view_10958 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10954.category} = ${view_10958.category} ;;
  }

  access_filter: {
    field: view_10954.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10954.is_deleted} = false ;;
}
