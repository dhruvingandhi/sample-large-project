# Explore: explore_1178
# Auto-generated LookML Explore File

include: "/views/domain_35/view_03535.view.lkml"
include: "/views/domain_37/view_03537.view.lkml"
include: "/views/domain_38/view_03538.view.lkml"
include: "/views/domain_39/view_03539.view.lkml"

explore: explore_1178 {
  label: "Explore Explore 1178"
  description: "Comprehensive analytics explore joining base view_03535 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_03535
  
  always_filter: {
    filters: [view_03535.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03535.created_at_date: "7 days"]
    unless: [view_03535.id, view_03535.status]
  }

  join: view_03537 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03535.user_id} = ${view_03537.id} ;;
    required_joins: []
  }

  join: view_03538 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03535.account_id} = ${view_03538.account_id} ;;
    required_joins: [view_03537]
  }

  join: view_03539 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03535.category} = ${view_03539.category} ;;
  }

  access_filter: {
    field: view_03535.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03535.is_deleted} = false ;;
}
