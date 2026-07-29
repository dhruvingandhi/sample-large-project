# Explore: explore_0030
# Auto-generated LookML Explore File

include: "/views/domain_41/view_00091.view.lkml"
include: "/views/domain_43/view_00093.view.lkml"
include: "/views/domain_44/view_00094.view.lkml"
include: "/views/domain_45/view_00095.view.lkml"

explore: explore_0030 {
  label: "Explore Explore 0030"
  description: "Comprehensive analytics explore joining base view_00091 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_00091
  
  always_filter: {
    filters: [view_00091.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00091.created_at_date: "7 days"]
    unless: [view_00091.id, view_00091.status]
  }

  join: view_00093 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00091.user_id} = ${view_00093.id} ;;
    required_joins: []
  }

  join: view_00094 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00091.account_id} = ${view_00094.account_id} ;;
    required_joins: [view_00093]
  }

  join: view_00095 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00091.category} = ${view_00095.category} ;;
  }

  access_filter: {
    field: view_00091.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00091.is_deleted} = false ;;
}
