# Explore: explore_2048
# Auto-generated LookML Explore File

include: "/views/domain_45/view_06145.view.lkml"
include: "/views/domain_47/view_06147.view.lkml"
include: "/views/domain_48/view_06148.view.lkml"
include: "/views/domain_49/view_06149.view.lkml"

explore: explore_2048 {
  label: "Explore Explore 2048"
  description: "Comprehensive analytics explore joining base view_06145 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_06145
  
  always_filter: {
    filters: [view_06145.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06145.created_at_date: "7 days"]
    unless: [view_06145.id, view_06145.status]
  }

  join: view_06147 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06145.user_id} = ${view_06147.id} ;;
    required_joins: []
  }

  join: view_06148 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06145.account_id} = ${view_06148.account_id} ;;
    required_joins: [view_06147]
  }

  join: view_06149 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06145.category} = ${view_06149.category} ;;
  }

  access_filter: {
    field: view_06145.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06145.is_deleted} = false ;;
}
