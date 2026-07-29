# Explore: explore_2888
# Auto-generated LookML Explore File

include: "/views/domain_15/view_08665.view.lkml"
include: "/views/domain_17/view_08667.view.lkml"
include: "/views/domain_18/view_08668.view.lkml"
include: "/views/domain_19/view_08669.view.lkml"

explore: explore_2888 {
  label: "Explore Explore 2888"
  description: "Comprehensive analytics explore joining base view_08665 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_08665
  
  always_filter: {
    filters: [view_08665.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08665.created_at_date: "7 days"]
    unless: [view_08665.id, view_08665.status]
  }

  join: view_08667 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08665.user_id} = ${view_08667.id} ;;
    required_joins: []
  }

  join: view_08668 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08665.account_id} = ${view_08668.account_id} ;;
    required_joins: [view_08667]
  }

  join: view_08669 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08665.category} = ${view_08669.category} ;;
  }

  access_filter: {
    field: view_08665.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08665.is_deleted} = false ;;
}
