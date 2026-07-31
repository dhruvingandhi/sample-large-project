# Update for 2000 file diff target
# Explore: explore_1979
# Auto-generated LookML Explore File

include: "/views/domain_38/view_05938.view.lkml"
include: "/views/domain_40/view_05940.view.lkml"
include: "/views/domain_41/view_05941.view.lkml"
include: "/views/domain_42/view_05942.view.lkml"

explore: explore_1979 {
  label: "Explore Explore 1979"
  description: "Comprehensive analytics explore joining base view_05938 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_05938
  
  always_filter: {
    filters: [view_05938.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05938.created_at_date: "7 days"]
    unless: [view_05938.id, view_05938.status]
  }

  join: view_05940 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05938.user_id} = ${view_05940.id} ;;
    required_joins: []
  }

  join: view_05941 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05938.account_id} = ${view_05941.account_id} ;;
    required_joins: [view_05940]
  }

  join: view_05942 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05938.category} = ${view_05942.category} ;;
  }

  access_filter: {
    field: view_05938.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05938.is_deleted} = false ;;
}
