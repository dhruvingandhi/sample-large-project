# Explore: explore_2233
# Auto-generated LookML Explore File

include: "/views/domain_50/view_06700.view.lkml"
include: "/views/domain_02/view_06702.view.lkml"
include: "/views/domain_03/view_06703.view.lkml"
include: "/views/domain_04/view_06704.view.lkml"

explore: explore_2233 {
  label: "Explore Explore 2233"
  description: "Comprehensive analytics explore joining base view_06700 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_06700
  
  always_filter: {
    filters: [view_06700.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06700.created_at_date: "7 days"]
    unless: [view_06700.id, view_06700.status]
  }

  join: view_06702 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06700.user_id} = ${view_06702.id} ;;
    required_joins: []
  }

  join: view_06703 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06700.account_id} = ${view_06703.account_id} ;;
    required_joins: [view_06702]
  }

  join: view_06704 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06700.category} = ${view_06704.category} ;;
  }

  access_filter: {
    field: view_06700.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06700.is_deleted} = false ;;
}
