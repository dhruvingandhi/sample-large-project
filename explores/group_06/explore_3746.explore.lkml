# Explore: explore_3746
# Auto-generated LookML Explore File

include: "/views/domain_39/view_11239.view.lkml"
include: "/views/domain_41/view_11241.view.lkml"
include: "/views/domain_42/view_11242.view.lkml"
include: "/views/domain_43/view_11243.view.lkml"

explore: explore_3746 {
  label: "Explore Explore 3746"
  description: "Comprehensive analytics explore joining base view_11239 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_11239
  
  always_filter: {
    filters: [view_11239.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11239.created_at_date: "7 days"]
    unless: [view_11239.id, view_11239.status]
  }

  join: view_11241 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11239.user_id} = ${view_11241.id} ;;
    required_joins: []
  }

  join: view_11242 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11239.account_id} = ${view_11242.account_id} ;;
    required_joins: [view_11241]
  }

  join: view_11243 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11239.category} = ${view_11243.category} ;;
  }

  access_filter: {
    field: view_11239.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11239.is_deleted} = false ;;
}
