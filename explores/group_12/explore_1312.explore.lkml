# Explore: explore_1312
# Auto-generated LookML Explore File

include: "/views/domain_37/view_03937.view.lkml"
include: "/views/domain_39/view_03939.view.lkml"
include: "/views/domain_40/view_03940.view.lkml"
include: "/views/domain_41/view_03941.view.lkml"

explore: explore_1312 {
  label: "Explore Explore 1312"
  description: "Comprehensive analytics explore joining base view_03937 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_03937
  
  always_filter: {
    filters: [view_03937.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03937.created_at_date: "7 days"]
    unless: [view_03937.id, view_03937.status]
  }

  join: view_03939 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03937.user_id} = ${view_03939.id} ;;
    required_joins: []
  }

  join: view_03940 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03937.account_id} = ${view_03940.account_id} ;;
    required_joins: [view_03939]
  }

  join: view_03941 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03937.category} = ${view_03941.category} ;;
  }

  access_filter: {
    field: view_03937.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03937.is_deleted} = false ;;
}
