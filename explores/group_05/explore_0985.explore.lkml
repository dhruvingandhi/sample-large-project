# Explore: explore_0985
# Auto-generated LookML Explore File

include: "/views/domain_06/view_02956.view.lkml"
include: "/views/domain_08/view_02958.view.lkml"
include: "/views/domain_09/view_02959.view.lkml"
include: "/views/domain_10/view_02960.view.lkml"

explore: explore_0985 {
  label: "Explore Explore 0985"
  description: "Comprehensive analytics explore joining base view_02956 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_02956
  
  always_filter: {
    filters: [view_02956.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02956.created_at_date: "7 days"]
    unless: [view_02956.id, view_02956.status]
  }

  join: view_02958 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02956.user_id} = ${view_02958.id} ;;
    required_joins: []
  }

  join: view_02959 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02956.account_id} = ${view_02959.account_id} ;;
    required_joins: [view_02958]
  }

  join: view_02960 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02956.category} = ${view_02960.category} ;;
  }

  access_filter: {
    field: view_02956.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02956.is_deleted} = false ;;
}
