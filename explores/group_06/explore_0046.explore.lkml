# Explore: explore_0046
# Auto-generated LookML Explore File

include: "/views/domain_39/view_00139.view.lkml"
include: "/views/domain_41/view_00141.view.lkml"
include: "/views/domain_42/view_00142.view.lkml"
include: "/views/domain_43/view_00143.view.lkml"

explore: explore_0046 {
  label: "Explore Explore 0046"
  description: "Comprehensive analytics explore joining base view_00139 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_00139
  
  always_filter: {
    filters: [view_00139.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00139.created_at_date: "7 days"]
    unless: [view_00139.id, view_00139.status]
  }

  join: view_00141 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00139.user_id} = ${view_00141.id} ;;
    required_joins: []
  }

  join: view_00142 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00139.account_id} = ${view_00142.account_id} ;;
    required_joins: [view_00141]
  }

  join: view_00143 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00139.category} = ${view_00143.category} ;;
  }

  access_filter: {
    field: view_00139.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00139.is_deleted} = false ;;
}
