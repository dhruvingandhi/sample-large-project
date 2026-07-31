# Update for 500 file diff target
# Explore: explore_0082
# Auto-generated LookML Explore File

include: "/views/domain_47/view_00247.view.lkml"
include: "/views/domain_49/view_00249.view.lkml"
include: "/views/domain_50/view_00250.view.lkml"
include: "/views/domain_01/view_00251.view.lkml"

explore: explore_0082 {
  label: "Explore Explore 0082"
  description: "Comprehensive analytics explore joining base view_00247 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_00247
  
  always_filter: {
    filters: [view_00247.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00247.created_at_date: "7 days"]
    unless: [view_00247.id, view_00247.status]
  }

  join: view_00249 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00247.user_id} = ${view_00249.id} ;;
    required_joins: []
  }

  join: view_00250 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00247.account_id} = ${view_00250.account_id} ;;
    required_joins: [view_00249]
  }

  join: view_00251 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00247.category} = ${view_00251.category} ;;
  }

  access_filter: {
    field: view_00247.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00247.is_deleted} = false ;;
}
