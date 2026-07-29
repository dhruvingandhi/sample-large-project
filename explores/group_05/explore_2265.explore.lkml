# Explore: explore_2265
# Auto-generated LookML Explore File

include: "/views/domain_46/view_06796.view.lkml"
include: "/views/domain_48/view_06798.view.lkml"
include: "/views/domain_49/view_06799.view.lkml"
include: "/views/domain_50/view_06800.view.lkml"

explore: explore_2265 {
  label: "Explore Explore 2265"
  description: "Comprehensive analytics explore joining base view_06796 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_06796
  
  always_filter: {
    filters: [view_06796.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06796.created_at_date: "7 days"]
    unless: [view_06796.id, view_06796.status]
  }

  join: view_06798 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06796.user_id} = ${view_06798.id} ;;
    required_joins: []
  }

  join: view_06799 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06796.account_id} = ${view_06799.account_id} ;;
    required_joins: [view_06798]
  }

  join: view_06800 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06796.category} = ${view_06800.category} ;;
  }

  access_filter: {
    field: view_06796.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06796.is_deleted} = false ;;
}
