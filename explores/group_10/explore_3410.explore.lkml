# Update for 2000 file diff target
# Explore: explore_3410
# Auto-generated LookML Explore File

include: "/views/domain_31/view_10231.view.lkml"
include: "/views/domain_33/view_10233.view.lkml"
include: "/views/domain_34/view_10234.view.lkml"
include: "/views/domain_35/view_10235.view.lkml"

explore: explore_3410 {
  label: "Explore Explore 3410"
  description: "Comprehensive analytics explore joining base view_10231 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_10231
  
  always_filter: {
    filters: [view_10231.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10231.created_at_date: "7 days"]
    unless: [view_10231.id, view_10231.status]
  }

  join: view_10233 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10231.user_id} = ${view_10233.id} ;;
    required_joins: []
  }

  join: view_10234 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10231.account_id} = ${view_10234.account_id} ;;
    required_joins: [view_10233]
  }

  join: view_10235 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10231.category} = ${view_10235.category} ;;
  }

  access_filter: {
    field: view_10231.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10231.is_deleted} = false ;;
}
