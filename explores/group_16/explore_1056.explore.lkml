# Explore: explore_1056
# Auto-generated LookML Explore File

include: "/views/domain_19/view_03169.view.lkml"
include: "/views/domain_21/view_03171.view.lkml"
include: "/views/domain_22/view_03172.view.lkml"
include: "/views/domain_23/view_03173.view.lkml"

explore: explore_1056 {
  label: "Explore Explore 1056"
  description: "Comprehensive analytics explore joining base view_03169 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_03169
  
  always_filter: {
    filters: [view_03169.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03169.created_at_date: "7 days"]
    unless: [view_03169.id, view_03169.status]
  }

  join: view_03171 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03169.user_id} = ${view_03171.id} ;;
    required_joins: []
  }

  join: view_03172 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03169.account_id} = ${view_03172.account_id} ;;
    required_joins: [view_03171]
  }

  join: view_03173 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03169.category} = ${view_03173.category} ;;
  }

  access_filter: {
    field: view_03169.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03169.is_deleted} = false ;;
}
