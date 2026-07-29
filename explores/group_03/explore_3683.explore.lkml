# Explore: explore_3683
# Auto-generated LookML Explore File

include: "/views/domain_50/view_11050.view.lkml"
include: "/views/domain_02/view_11052.view.lkml"
include: "/views/domain_03/view_11053.view.lkml"
include: "/views/domain_04/view_11054.view.lkml"

explore: explore_3683 {
  label: "Explore Explore 3683"
  description: "Comprehensive analytics explore joining base view_11050 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_11050
  
  always_filter: {
    filters: [view_11050.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11050.created_at_date: "7 days"]
    unless: [view_11050.id, view_11050.status]
  }

  join: view_11052 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11050.user_id} = ${view_11052.id} ;;
    required_joins: []
  }

  join: view_11053 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11050.account_id} = ${view_11053.account_id} ;;
    required_joins: [view_11052]
  }

  join: view_11054 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11050.category} = ${view_11054.category} ;;
  }

  access_filter: {
    field: view_11050.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11050.is_deleted} = false ;;
}
