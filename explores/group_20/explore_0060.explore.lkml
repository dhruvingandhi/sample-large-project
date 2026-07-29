# Explore: explore_0060
# Auto-generated LookML Explore File

include: "/views/domain_31/view_00181.view.lkml"
include: "/views/domain_33/view_00183.view.lkml"
include: "/views/domain_34/view_00184.view.lkml"
include: "/views/domain_35/view_00185.view.lkml"

explore: explore_0060 {
  label: "Explore Explore 0060"
  description: "Comprehensive analytics explore joining base view_00181 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_00181
  
  always_filter: {
    filters: [view_00181.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00181.created_at_date: "7 days"]
    unless: [view_00181.id, view_00181.status]
  }

  join: view_00183 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00181.user_id} = ${view_00183.id} ;;
    required_joins: []
  }

  join: view_00184 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00181.account_id} = ${view_00184.account_id} ;;
    required_joins: [view_00183]
  }

  join: view_00185 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00181.category} = ${view_00185.category} ;;
  }

  access_filter: {
    field: view_00181.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00181.is_deleted} = false ;;
}
