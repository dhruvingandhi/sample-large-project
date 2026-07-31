# Update for 2000 file diff target
# Explore: explore_0178
# Auto-generated LookML Explore File

include: "/views/domain_35/view_00535.view.lkml"
include: "/views/domain_37/view_00537.view.lkml"
include: "/views/domain_38/view_00538.view.lkml"
include: "/views/domain_39/view_00539.view.lkml"

explore: explore_0178 {
  label: "Explore Explore 0178"
  description: "Comprehensive analytics explore joining base view_00535 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_00535
  
  always_filter: {
    filters: [view_00535.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00535.created_at_date: "7 days"]
    unless: [view_00535.id, view_00535.status]
  }

  join: view_00537 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00535.user_id} = ${view_00537.id} ;;
    required_joins: []
  }

  join: view_00538 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00535.account_id} = ${view_00538.account_id} ;;
    required_joins: [view_00537]
  }

  join: view_00539 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00535.category} = ${view_00539.category} ;;
  }

  access_filter: {
    field: view_00535.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00535.is_deleted} = false ;;
}
