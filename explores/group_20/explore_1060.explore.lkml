# Explore: explore_1060
# Auto-generated LookML Explore File

include: "/views/domain_31/view_03181.view.lkml"
include: "/views/domain_33/view_03183.view.lkml"
include: "/views/domain_34/view_03184.view.lkml"
include: "/views/domain_35/view_03185.view.lkml"

explore: explore_1060 {
  label: "Explore Explore 1060"
  description: "Comprehensive analytics explore joining base view_03181 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_03181
  
  always_filter: {
    filters: [view_03181.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03181.created_at_date: "7 days"]
    unless: [view_03181.id, view_03181.status]
  }

  join: view_03183 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03181.user_id} = ${view_03183.id} ;;
    required_joins: []
  }

  join: view_03184 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03181.account_id} = ${view_03184.account_id} ;;
    required_joins: [view_03183]
  }

  join: view_03185 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03181.category} = ${view_03185.category} ;;
  }

  access_filter: {
    field: view_03181.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03181.is_deleted} = false ;;
}
