# Explore: explore_2060
# Auto-generated LookML Explore File

include: "/views/domain_31/view_06181.view.lkml"
include: "/views/domain_33/view_06183.view.lkml"
include: "/views/domain_34/view_06184.view.lkml"
include: "/views/domain_35/view_06185.view.lkml"

explore: explore_2060 {
  label: "Explore Explore 2060"
  description: "Comprehensive analytics explore joining base view_06181 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_06181
  
  always_filter: {
    filters: [view_06181.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06181.created_at_date: "7 days"]
    unless: [view_06181.id, view_06181.status]
  }

  join: view_06183 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06181.user_id} = ${view_06183.id} ;;
    required_joins: []
  }

  join: view_06184 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06181.account_id} = ${view_06184.account_id} ;;
    required_joins: [view_06183]
  }

  join: view_06185 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06181.category} = ${view_06185.category} ;;
  }

  access_filter: {
    field: view_06181.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06181.is_deleted} = false ;;
}
